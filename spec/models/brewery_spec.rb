require 'rails_helper'

RSpec.describe Brewery, type: :model do
  describe '正常系のテスト' do
    it 'is valid with a name, name_kana, post_code, address' do
      brewery = Brewery.new(
        name: '藤本雅一酒造醸',
        name_kana: 'フジモトミヤビイチシュゾウジョウ',
        post_code: '5830024',
        address: '大阪府藤井寺市藤井寺2丁目1番10号'
      )
      expect(brewery).to be_valid
    end
    
    it 'is valid with all colums( name, name_kana, post_code, address, phone_number, email, url )' do
      brewery = Brewery.new(
        name: '藤本雅一酒造醸',
        name_kana: 'フジモトミヤビイチシュゾウジョウ',
        post_code: '5830024',
        address: '大阪府藤井寺市藤井寺2丁目1番10号',
        phone_number: '0729550018',
        email: 'email@nazo.com',
        url: 'http://www.fujimotosyuzou.com/index.html'
      )
      expect(brewery).to be_valid
    end
  end
  
  describe '異常系のテスト' do
    context 'when the value is empty' do
      it 'is invalid without a name' do
        brewery = Brewery.new(name: nil)
        brewery.valid?
        expect(brewery.errors[:name]).to include("can't be blank")
      end
    end
  end
end
