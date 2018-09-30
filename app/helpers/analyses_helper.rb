module AnalysesHelper

  # chart-1用 県別の飲酒回数
  def address_count_keys
    takes_number = 5
    arr_address = []

    @posts.each do |post|
      arr_address << post.sake.brewery.address_prefecture
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
      arr_address << post.sake.brewery.address_prefecture
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
  def evaluation_prefecture_keys
    takes_number = 5

    arr_evaluation = []
    @evaluations.each do |evaluation|
      arr_evaluation << evaluation.address_prefecture
      arr_evaluation << evaluation.avg_star
    end

    hash_evaluation = Hash[*arr_evaluation]

    # ハッシュを降順に並べ替える
    @evaluation_sort = Hash[hash_evaluation.sort_by{ |_, v| -v }]

    return @evaluation_sort.keys.take(takes_number)
  end

  def evaluation_prefecture_values
    takes_number = 5

    arr_evaluation = []
    @evaluations.each do |evaluation|
      arr_evaluation << evaluation.address_prefecture
      arr_evaluation << evaluation.avg_star
    end

    hash_evaluation = Hash[*arr_evaluation]

    # ハッシュを降順に並べ替える
    @evaluation_sort = Hash[hash_evaluation.sort_by{ |_, v| -v }]

    return @evaluation_sort.values.take(takes_number) << 0
  end
end
