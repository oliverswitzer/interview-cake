# What We Learned

Another question using a greedy ↴ approach. The tricky thing about this one: we couldn't actually solve it in one pass. But we could solve it in two passes!

This approach probably wouldn't have been obvious if we had started off trying to use a greedy approach.

Instead, we started off by coming up with a slow (but correct) brute force solution and trying to improve from there. We looked at what our solution actually calculated, step by step, and found some repeat work. Our final answer came from brainstorming ways to avoid doing that repeat work.

So that's a pattern that can be applied to other problems:

Start with a brute force solution, look for repeat work in that solution, and modify it to only do that work once.