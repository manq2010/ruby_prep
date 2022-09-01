# Variables as Pointers

We'll take a deeper look at variables in this section, and specifically how they act as pointers to an **address space** in memory. That is, the variable doesn't actually contain the value. Instead, it contains a pointer to a specific area in memory that contains the value. This is a concept that confuses a lot of new programmers, and it's also one of the most important concepts to understand. The easiest way to understand variables as pointers is to look at some examples.

```ruby
a = "hi there"
b = a
a = "not here"
```

![variable pointer 1](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/variables_pointers1.jpg)

From the above diagram, we can see that the code `a` = `"not here"` reassigned the variable `a` to a completely different address in memory; it's now pointing to an entirely new string. This is what the`=` operator does. It's important to understand that different memory space can in fact hold the same value, but they are still different places in memory. For example, if our last line of code was `a = "hi there"`, the result would still be the same: `a` and `b` in that case would still point to different addresses in memory; they would just happen to have the same value.

```ruby
a = "hi there"
b = a
a << ", Bob"
```

![variable pointer 2](https://d2aw5xe2jldque.cloudfront.net/books/ruby/images/variables_pointers2.jpg)

he line of code ``a << ", Bob"`` did **not** result in reassigning `a` to a new string. Rather, it *mutated the caller* and modified the existing string, which is also pointed to by the variable `b`. This explains why in this code, `b` reflects the changes to `a` - they're both pointing to the same thing.

This is the major point of this section: some operations mutate the address space, while others simply make the variable point to a different address space.


