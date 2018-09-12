class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
  end

  def blair_nums(n)
    return @blair_cache[n] unless @blair_cache[n].nil?
    ans = blair_nums(n - 1) + blair_nums(n - 2) + k_th_odd(n)
    @blair_cache[n] = ans
    ans
  end

  def k_th_odd(n)
    first = 1
    (n - 2).times { first += 2 }
    first
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = { 1 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
    return cache if n < 4
    # (4..n).each do |i|
    #   cache[i] = cache[i - 1].each do |k|
    #     k + cache[1]
    #   end
    # end
    cache
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
