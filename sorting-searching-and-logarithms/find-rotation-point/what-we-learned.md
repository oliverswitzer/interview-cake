# Complexity

Each time we go through the while loop, we cut our range of indices in half, just like binary search. So we have O(\lg{n})O(lgn) loop iterations.

In each loop iteration, we do some arithmetic and a string comparison. The arithmetic is constant time, but the string comparison requires looking at characters in both words—every character in the worst case. Here, we'll assume our word lengths are bounded by some constant so we'll say the string comparison takes constant time.

The longest word in English is pneumonoultramicroscopicsilicovolcanoconiosis, a medical term. It's 45 letters long.

Putting everything together, we do O(\lg{n})O(lgn) iterations, and each iteration is O(1)O(1) time. So our time complexity is O(\lg{n})O(lgn).

Some languages—like German, Russian, and Dutch—can have arbitrarily long words, so we might want to factor the length of the words into our runtime. We could say the length of the words is \ellℓ, each string comparison takes O(\ell)O(ℓ) time, and the whole algorithm takes O(\ell*\lg{n})O(ℓ∗lgn) time.

We use O(1)O(1) space to store the first word and the floor and ceiling indices.

Bonus
This method assumes that the array is rotated. If it isn't, what index will it return? How can we fix our method to return 0 for an unrotated array?

What We Learned
The answer was a modified version of binary search.

This is a great example of the difference between "knowing" something and knowing something. You might have seen binary search before, but that doesn't help you much unless you've learned the lessons of binary search.

Binary search teaches us that when an array is sorted or mostly sorted:

The value at a given index tells us a lot about what's to the left and what's to the right.
We don't have to look at every item in the array. By inspecting the middle item, we can "rule out" half of the array.
We can use this approach over and over, cutting the problem in half until we have the answer. This is sometimes called "divide and conquer."
So whenever you know an array is sorted or almost sorted, think about these lessons from binary search and see if they apply.

# What We Learned
The answer was a modified version of binary search.

This is a great example of the difference between "knowing" something and knowing something. You might have seen binary search before, but that doesn't help you much unless you've learned the lessons of binary search.

Binary search teaches us that when an array is sorted or mostly sorted:

The value at a given index tells us a lot about what's to the left and what's to the right.
We don't have to look at every item in the array. By inspecting the middle item, we can "rule out" half of the array.
We can use this approach over and over, cutting the problem in half until we have the answer. This is sometimes called "divide and conquer."
So whenever you know an array is sorted or almost sorted, think about these lessons from binary search and see if they apply.