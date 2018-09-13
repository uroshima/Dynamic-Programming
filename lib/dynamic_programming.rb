class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @hops_cache = { 1 => [[1]],
                    2 => [[1,1], [2]],
                    3 => [[1,1,1], [1,2], [2,1], [3]]}
    @super_hops_cache = {}
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

    (4..n).each do |i|
        cache[i] = update(cache[i-1], (1)) + update(cache[i-2], (2)) + update(cache[i-3], (3))
    end
    cache
  end

  def update(cache, i)
    cache.map do |subArray|
      subArray + [i]
    end
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @hops_cache[n] unless @hops_cache[n].nil?

    cur_cache = []
    cur_cache.concat(frog_hops_top_down_helper(n - 3).map{ |el| el += [3]})
    cur_cache.concat(frog_hops_top_down_helper(n - 2).map{ |el| el += [2]})
    cur_cache.concat(frog_hops_top_down_helper(n - 1).map{ |el| el += [1]})
    @hops_cache[n] = cur_cache
  end

  def super_frog_hops(n, k)
    ways_collection = [[[]], [[1]]]
    return ways_collection[n] if n < 2

    (2..n).each do |i|
      new_way_set = []

      (1..k).each do |first_step|
        break if i - first_step < 0
        ways_collection[i - first_step].each do |way|
          new_way = [first_step]

          way.each do |step|
            new_way << step
          end

          new_way_set << new_way
        end
      end

      ways_collection << new_way_set
    end

    ways_collection[n]
  end

  def knapsack(weights, values, capacity)
    return 0 if capacity == 0 || weights.length == 0
    solution_table = knapsack_table(weights, values, capacity)
    solution_table[capacity][-1]
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    solution_table = []

    (0..capacity).each do |i|
      solution_table[i] = []

      (0...weights.length).each do |j|
        if i == 0
          solution_table[i][j] = 0
        elsif j == 0
          solution_table[i][j] = i < weights[0] ? 0 : values[0]
        else
          option1 = solution_table[i][j - 1]
          option2 = i < weights[j] ? 0 : solution_table[i - weights[j]][j - 1] + values[j]
          optimum = [option1, option2].max
          solution_table[i][j] = optimum
        end

      end
    end

    solution_table
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
