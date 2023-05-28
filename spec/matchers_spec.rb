# frozen_string_literal: true

describe 'Matchers' do
  it 'asserts on equality' do
    number = 3
    expect(number).to eq 3
  end
  it 'asserts on mathematical operators' do
    number = 7
    expect(number).to be >= 4
  end
  it 'asserts on matching a regular expression' do
    email = 'm.monierx@gmail.com'
    regular_expression = /\w+@\w+\.[a-z]{2,4}$/
    expect(email).to match regular_expression
  end
  it 'asserts on types and classes' do
    object = 2.0
    expect(object).to be_an_instance_of Float
  end
  it 'asserts on truthiness' do
    nil_value = nil
    expect(nil_value).to be_falsy
  end
  it 'expects errors' do
    expect do
      raise ArgumentError
    end.to raise_error ArgumentError
  end
  it 'expects throws' do
    expect do
      throw :oops
    end.to throw_symbol :oops
  end

  it 'asserts on predictions' do
    class A
      def good?
        true
      end
    end
    expect(A.new).to be_good
  end
  it 'asserts on collections' do
    list = %i[one two three four]
    expect(list).to include :four
    expect(list).to start_with :one
    expect(list).to start_with %i[one two]
    expect(list).to end_with :four
  end
  it 'negates asserts' do
    expect(3).not_to be 2
  end
end
