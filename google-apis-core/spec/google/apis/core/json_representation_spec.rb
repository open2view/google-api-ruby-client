# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'
require 'google/apis/core/json_representation'

RSpec.describe Google::Apis::Core::JsonRepresentation do
  let(:child_class) do
    Class.new do
      attr_accessor :value
    end
  end

  let(:model_class) do
    rep_class = representer_class
    Class.new do
      attr_accessor :unset_value
      attr_accessor :nil_value
      attr_accessor :numeric_value
      attr_accessor :string_value
      attr_accessor :boolean_value_true
      attr_accessor :boolean_value_false
      attr_accessor :datetime_value
      attr_accessor :nil_datetime_value
      attr_accessor :date_value
      attr_accessor :nil_date_value
      attr_accessor :bytes_value
      attr_accessor :big_value
      attr_accessor :items
      attr_accessor :child
      attr_accessor :children
      const_set(:Representation, rep_class)
      include Google::Apis::Core::JsonObjectSupport
    end
  end

  let(:representer_class) do
    klass = child_class
    Class.new(Google::Apis::Core::JsonRepresentation) do
      property :unset_value, as: 'unsetValue'
      property :nil_value, as: 'nilValue'
      property :numeric_value, as: 'numericValue'
      property :string_value, as: 'stringValue'
      property :boolean_value_true, as: 'booleanValueTrue'
      property :boolean_value_false, as: 'booleanValueFalse'
      property :datetime_value, as: 'dateTimeValue', type: DateTime
      property :nil_datetime_value, as: 'nullDateTimeValue', type: DateTime
      property :date_value, as: 'dateValue', type: Date
      property :nil_date_value, as: 'nullDateValue', type: Date
      property :bytes_value, as: 'bytesValue', base64: true
      property :big_value, as: 'bigValue', numeric_string: true
      property :items
      property :child, class: klass do
        property :value
      end
      collection :children, class: klass do
        property :value
      end
    end
  end

  shared_examples 'it serializes' do
    it 'does not serialize unset values' do
      expect(json).not_to have_json_path('unsetValue')
    end

    it 'serializes explicit nil values' do
      expect(json).to be_json_eql(%(null)).at_path('nilValue')
    end

    it 'serializes numeric values' do
      expect(json).to be_json_eql(%(123)).at_path('numericValue')
    end

    it 'serializes string values' do
      expect(json).to be_json_eql(%("test")).at_path('stringValue')
    end

    it 'serializes boolean values' do
      expect(json).to be_json_eql(%(true)).at_path('booleanValueTrue')
      expect(json).to be_json_eql(%(false)).at_path('booleanValueFalse')
    end

    it 'serializes datetime values' do
      expect(json).to be_json_eql(%("2015-05-01T12:00:00.000+00:00")).at_path('dateTimeValue')
    end

    it 'allows nil datetime values' do
      expect(json).to be_json_eql(%(null)).at_path('nullDateTimeValue')
    end

    it 'serializes date values' do
      expect(json).to be_json_eql(%("2015-05-01")).at_path('dateValue')
    end

    it 'allows nil date values' do
      expect(json).to be_json_eql(%(null)).at_path('nullDateValue')
    end

    it 'serializes byte values to base64' do
      expect(json).to be_json_eql(%("SGVsbG8gd29ybGQ=")).at_path('bytesValue')
    end

    it 'serializes basic collections' do
      expect(json).to be_json_eql(%([1,2,3])).at_path('items')
    end

    it 'serializes nested objects' do
      expect(json).to be_json_eql(%({"value" : "child"})).at_path('child')
    end

    it 'serializes object collections' do
      expect(json).to be_json_eql(%([{"value" : "child"}])).at_path('children')
    end

    it 'serializes numeric strings' do
      expect(json).to be_json_eql(%("1208925819614629174706176")).at_path('bigValue')
    end
  end

  context 'with model object' do
    let(:json) { representer_class.new(model).to_json(user_options: { skip_undefined: true }) }
    let(:model) do
      model = model_class.new
      model.nil_value = nil
      model.numeric_value = 123
      model.string_value = 'test'
      model.datetime_value = DateTime.new(2015, 5, 1, 12)
      model.nil_datetime_value = nil
      model.date_value = Date.new(2015, 5, 1)
      model.nil_date_value = nil
      model.boolean_value_true = true
      model.boolean_value_false = false
      model.bytes_value = 'Hello world'
      model.items = [1, 2, 3]
      model.child = child_class.new
      model.child.value = 'child'
      model.children = [model.child]
      model.big_value = 1208925819614629174706176
      model
    end

    include_examples 'it serializes'

    it 'supports standard serialization from JSON gem' do
      str = JSON.generate(model)
      expect(str).to start_with("{\"")
    end

    it 'supports pretty serialization from JSON gem' do
      str = JSON.pretty_generate(model)
      expect(str).to start_with("{\n  ")
    end
  end

  context 'with hash' do
    let(:json) { representer_class.new(model).to_json(user_options: { skip_undefined: true }) }
    let(:model) do
      {
        nil_value: nil,
        string_value: 'test',
        numeric_value: 123,
        datetime_value: DateTime.new(2015, 5, 1, 12),
        nil_datetime_value: nil,
        date_value: Date.new(2015, 5, 1),
        nil_date_value: nil,
        boolean_value_true: true,
        boolean_value_false: false,
        bytes_value: 'Hello world',
        big_value: 1208925819614629174706176,
        items: [1, 2, 3],
        child: {
          value: 'child'
        },
        children: [{ value: 'child' }]
      }
    end

    include_examples 'it serializes'
  end

  context 'when de-serializing' do
    let(:model) { representer_class.new(model_class.new).from_json(json) }
    let(:json) do
      json = <<EOF
{ "stringValue": "test",
  "nilValue": null,
  "booleanValueTrue": true,
  "booleanValueFalse": false,
  "numericValue": 123,
  "dateTimeValue": "2015-05-01T12:00:00+00:00",
  "nullDateTimeValue": null,
  "dateValue": "2015-05-01",
  "nullDateValue": null,
  "bytesValue": "SGVsbG8gd29ybGQ=",
  "bigValue": "1208925819614629174706176",
  "items": [1,2,3],
  "child": {"value" : "hello"},
  "children": [{"value" : "hello"}]
}
EOF
    end

    it 'deserializes string values' do
      expect(model.string_value).to eql 'test'
    end

    it 'deserializes null values' do
      expect(model.nil_value).to be_nil
    end

    it 'deserializes numeric values' do
      expect(model.numeric_value).to eql 123
    end

    it 'deserializes boolean values' do
      expect(model.boolean_value_true).to be_truthy
      expect(model.boolean_value_false).to be_falsey
    end

    it 'deserializes datetime values' do
      expect(model.datetime_value).to eql DateTime.new(2015, 5, 1, 12)
    end

    it 'deserializes null datetime values' do
      expect(model.nil_datetime_value).to be_nil
    end

    it 'deserializes date values' do
      expect(model.date_value).to eql Date.new(2015, 5, 1)
    end

    it 'deserializes null date values' do
      expect(model.nil_date_value).to be_nil
    end

    it 'deserializes basic collections' do
      expect(model.items).to contain_exactly(1, 2, 3)
    end

    it 'deserializes nested objects' do
      expect(model.child.value).to eql 'hello'
    end

    it 'serializes object collections' do
      expect(model.children[0].value).to eql 'hello'
    end

    it 'deserializes numeric strings' do
      expect(model.big_value).to eql 1208925819614629174706176
    end

  end
end
