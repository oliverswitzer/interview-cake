# Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when everyone is available.
#
# To do this, you’ll need to know when any team is having a meeting. In HiCal, a meeting is stored as an array ↴ of integers
# [start_time, end_time]. These integers represent the number of 30-minute blocks past 9:00am.

def merge_ranges(meetings)
  # Sorting adds O(n log n) worst case. We need to sort meetings by start time so that we can be sure
  # that, in the two meetings we compare (meeting1 and meeting2), that the start time of meeting1 comes
  # before the start time of meeting2. This will make our assumption that the two meetings intersect true as long
  # as the first meetings end time is greater than the second meetings start time.
  sorted_meetings = meetings.sort

  # This new array adds O(n) space complexity
  merged_meetings = [sorted_meetings[0]]

  # This each loop adds O(n)
  sorted_meetings[1..-1].each_with_index do |meeting, i|
    current_mergable_range = merged_meetings.last

    end_1 = current_mergable_range[1]
    start_2 = meeting[0]
    end_2 = meeting[1]

    if end_1 >= start_2
      # Adjust end time of the current merged meeting
      current_mergable_range[1] = end_2 if end_2 >= end_1
    else
      # Add a new merged meeting range, since there is no overlap between the two meetings we're comparing
      #    SIDE NOTE: As an amortized cost, this operation is O(1). However, this just an average cost. https://en.wikipedia.org/wiki/Amortized_analysis
      merged_meetings << sorted_meetings[i+1]
    end
  end


  merged_meetings
end


meetings = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10], [1, 15]]
expected_merged_meetings = [[0, 15]]

puts "Actual merged meetings #{merge_ranges(meetings).inspect}"
puts "Expected merged meetings #{expected_merged_meetings}"

meetings = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
expected_merged_meetings = [[0, 1], [3, 8], [9, 12]]

puts "Actual merged meetings #{merge_ranges(meetings).inspect}"
puts "Expected merged meetings #{expected_merged_meetings}"
