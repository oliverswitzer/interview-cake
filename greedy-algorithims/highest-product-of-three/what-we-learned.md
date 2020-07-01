# What We Learned
Greedy ↴ algorithms in action again!

That's not a coincidence—to illustrate how one pattern can be used to break down several different questions, we're showing this one pattern in action on several different questions.

Usually it takes seeing an algorithmic idea from a few different angles for it to really make intuitive sense.

Our goal here is to teach you the right way of thinking to be able to break down problems you haven't seen before. Greedy algorithm design is a big part of that way of thinking.

For this one, we built up our greedy algorithm exactly the same way we did for the Apple stocks question. By asking ourselves:

"Suppose we could come up with the answer in one pass through the input, by simply updating the 'best answer so far' as we went. What additional values would we need to keep updated as we looked at each item in our set, in order to be able to update the 'best answer so far' in constant time?"

For the Apple stocks question, the only "additional value" we needed was the min price so far.

For this one, we needed four things in order to calculate the new highest_product_of_3 at each step:

highest_product_of_2
highest
lowest_product_of_2
lowest