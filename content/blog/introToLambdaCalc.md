---
{
  "type": "blog",
  "author": "Gavin Lui",
  "title": "Lambda Calculus, the building blocks of Functional Programming",
  "description": "An introduction to the basic concepts of lambda calculus, and how it relates to FP.",
  "image": "images/article-covers/introToLambdaCalc-mathNerd.jpeg",
  "published": "2021-09-12",
}
---

## I'm here to code. Why am I studying math again??

After trying Scala and functional programming for little while, I was finding difficulty in understanding a lot of the core concepts (and still am). Sure, I can stitch some code together but do I understand what is going on? Not really.

Here's a summary of my experience...

- Let's jump straight into the codebase and work it out -> New language & paradigm = what is going on??
- Let's read some of the documentation and work it out -> New technical terminology and complex concepts = what is going on??
- Let's ask people what things mean and work it out -> Lots of people explaining in their own way = what is going on??

_I'm doing the same things I would for any other language, so why am I struggling so much? WHAT IS GOING ON?_

Then, I asked myself:
_What is making FP more difficult to understand than OOP??_

And it hit me - I don't have any understanding of the core concept on which FP is derived from, which is **lambda calculus**.

See, OOP is fairly straightforward and intuitive - its modelling things on the idea of objects with their own characteristics. This requires little explanation as it's a concept that's been ingrained into our brains since childhood:

![OOP concept example with animals](images/introToLambdaCalc/OOPexample.png "OOP example")

For example, we all know that generally an animal has 2 eyes, can eat drink and move. A dog can have all these characteristics AND has 4 legs, can bark and lick. Whereas a kangaroo can have those characteristics, but has 2 legs and jumps and kicks instead. Easy to understand!

But with FP, it's modelled on..."lambda calculus"? I don't remember learning that in primary school 🤔

So without further ado, here goes my attempt at explaining lambda calculus...

## Lambda calculus basics

You might remember calculus from high school mathematics as being a way of calculating or modelling a problem. Differentiation, integrals, algebra - all these terms may come to mind. Lambda calculus is simply another way to reason through problems by only really using functions, variables and values, all of which are treated as **expressions**.

The name is given based on how the Lambda symbol is used to denote the binding of a variable in a function:

![base lambda example](images/introToLambdaCalc/lambda1.png "lambda example 1")

From above, we can see two lambdas - one that binds the variable x, and one that binds the variable y:

![base lambda example 2](images/introToLambdaCalc/lambda2.png "lambda example 2")

"Abstractions" consist of Lambdas that indicate which variables are "bound". You can think of _λx_ as saying, "ok I'll replace all the _x_ with what ever you give me", and likewise with _λy_. Here, the input for x is 1, and the input for y is 2. From past exprience in calculus, you'd think you can just skip straight to _1+2=3_. That's not exactly the case with lambda calculus. Inputs are supplied **one by one from left to right** as "values" written on the right hand side, and are evaluated and simplified to a final expression that cannot be reduced any more (also known as the **beta normal form**). This process is known as **beta reduction** So if we supplied the first input of 1, what would we get? Let's take a look:

![base lambda example 3](images/introToLambdaCalc/lambda3.png "lambda example 3")

As we can see, the result of supplying our first parameter _1_ to our first lambda function _λx.x+y_ is... another lambda function, _λy.1+y_!
So if we supply the final input of 2, we'll of course get the answer of 3 which cannot be reduced any further:

![base lambda example 4](images/introToLambdaCalc/lambda4.png "lambda example 4")

It is important to note the following principles that underpin lambda calculus:

- **all expressions are pure. In other words, the same input will ALWAYS give the same output. I.e. given the same input, the output should always be predictable!**
- **Lambdas only bind one parameter. Therefore functions are only supplied with ONE input, and are evaluated to ONE output. The process of evaluation is known as "beta reduction"**
- **Functions are there to evaluate and return a value. If it does anything else (eg. logging output, print to CLI, speak to another program, goes out for lunch) it is impure, and these other actions are known as SIDE EFFECTS.**

And honestly...that's all you really need to know. Of course, there are much more complex problems, but the process for reduction is the same - insert the value in place of the variable bound by _λ_, then simplify and reduce. Rinse and repeat for the next inputs and reduce until you can't reduce anymore!

The interesting thing about Lambda calculus, is that a simple process such as this has the ability to represent ANY COMPUTATION. Computers these days were basically developed using the Turing Machine as a basis. However, anything that can be calculated using a Turing machine, can be done using lambda calculus. I'm talking booleans, integers, operations, you name it - whatever a Turing machine can compute, lambda calculus can too. This is done with the help of "Encodings", but that's a topic for another day.

Why is this significant? Because we no longer have a dependence on state like computers do, we don't really have to worry about how the computer implements calculations and we can start to focus more on software than hardware - and aren't we here to build software? 👀

## References

- [Brief history on Church and Turing by The School of Computer Science at Carnegie Mellon University in Pittsburgh](https://www.cs.cmu.edu/~rwh/talks/cs50talk.pdf)
- [A Tutorial Introduction to the Lambda Calculus by The University of Texas at Dallas](https://personal.utdallas.edu/~gupta/courses/apl/lambda.pdf)
- [Fantastic intro lecture on Lambda Calculus and its history](https://www.youtube.com/watch?v=3VQ382QG-y4&t=2160s)
