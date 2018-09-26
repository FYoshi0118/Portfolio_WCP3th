module AnalysesHelper

  # chart-1用 県別の飲酒回数
  def address_count_keys
    takes_number = 5
    arr_address = []

    @posts.each do |post|
      arr_address << post.sake.brewery.address.match(/.*[都道府県]/).to_s
    end

    # 配列要素の出現回数を調べる
    @address_count = Hash.new(0)
    arr_address.each do |elem|
      @address_count[elem] += 1
    end

    # ハッシュを降順に並べ替える
    @address_count = Hash[@address_count.sort_by{ |_, v| -v }]
    
    return @address_count.keys.take(takes_number)
  end

  def address_count_values
    takes_number = 5
    arr_address = []

    @posts.each do |post|
      arr_address << post.sake.brewery.address.match(/.*[都道府県]/).to_s
    end

    # 配列要素の出現回数を調べる
    @address_count = Hash.new(0)
    arr_address.each do |elem|
      @address_count[elem] += 1
    end

    # ハッシュを降順に並べ替える
    @address_count = Hash[@address_count.sort_by{ |_, v| -v }]

    return @address_count.values.take(takes_number) << 0
  end

  # chart-2用 県別の星評価数
  def test
    takes_number = 5
    arr = []

    # @arr_addressに○○県を追加する（重複関係なく追加）
    # @posts = Post.where(user_id: current_user.id)

    @posts.each do |post|
      arr << post.sake.brewery.address.match(/.*[都道府県]/).to_s
      arr << post.star
    end

    hash_arr = Hash[*arr]
    binding.pry
    # 配列要素の出現回数を調べる
    @address_count = Hash.new(0)
    arr_address.each do |elem|
      @address_count[elem] += 1
    end

    # ハッシュを降順に並べ替える
    @address_count = Hash[@address_count.sort_by{ |_, v| -v }]
    
    return @address_count.keys.take(takes_number)
  end
end
