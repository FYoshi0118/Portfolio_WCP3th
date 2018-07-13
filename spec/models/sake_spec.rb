require 'rails_helper'

RSpec.describe Sake, type: :model do
  describe 'normal system test'do
    it 'has a valid factory' do
      expect(FactoryBot.build(:sake)).to be_valid
    end

    it 'has a valid factory(specially_designated, recipe, flavor, nihonshudo, acidity)' do
      expect(FactoryBot.build(:sake, specially_designated: '純米酒',
                                     recipe: '無濾過生原酒',
                                     flavor: '爽酒',
                                     nihonshudo: -1,
                                     acidity: -2
                              )).to be_valid
    end

    it 'the default for is_confirmed is false' do
      sake = FactoryBot.build(:sake)
      expect(sake.is_confirmed).to eq false
    end
    
    it '日本酒度 = 1、酸度 = 1の場合、甘辛度は0.34(文字列)' do
      sake = FactoryBot.build(:sake, nihonshudo: 1, acidity: 1)
      nihonshudo = sake.amakarado(sake.nihonshudo.to_f, sake.acidity.to_f)
      expect(nihonshudo).to eq '0.34'
    end
  end

  describe 'error system test' do
    context 'when the value is empty' do
      it 'is invalid without brand' do
        sake = FactoryBot.build(:sake, brand: nil)
        sake.valid?
        expect(sake.errors[:brand]).to include("can't be blank")
      end
    end
    
    context 'when the value is limited' do
      it 'is invalid except flavor at nil, 燻酒, 爽酒, 熟酒 and 醇酒' do
        sake = FactoryBot.build(:sake, flavor: 'test')
        sake.valid?
        expect(sake.errors[:flavor]).to include('is not included in the list')
      end
    end
  end

end
