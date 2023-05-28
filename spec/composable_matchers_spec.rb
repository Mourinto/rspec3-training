# frozen_string_literal: true

describe 'Comosable Matchers' do
  it 'works with nested data' do
    class Product
      def initialize(id, name, category)
        @id = id
        @name = name
        @category = category
      end

      def serial_data
        ['X-',
         @name[0],
         @category[0],
         @id]
      end
    end
    product = Product.new(273, 'Orange', 'Fruit')

    expect(product.serial_data).to contain_exactly(
      start_with('X-'),
      start_with('O'),
      start_with('F'),
      be < 500
    ) # X-OF273
    # check https://gist.github.com/JunichiIto/f603d3fbfcf99b914f86
  end

  it 'compound matchers AND' do
    string = 'Monier'

    expect(string).to start_with('M').and end_with('r')
  end

  it 'compound matchers OR' do
    string = 'Monier'

    expect(string).to start_with('M').or end_with('t')
  end
end
