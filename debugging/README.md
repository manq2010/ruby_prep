© Mancoba Sihlongonyane <br>
(Maintainer)

# Debugging

In computer programming and software development, debugging is the process of finding and resolving bugs (defects or problems that prevent correct operation) within computer programs, software, or systems.

Table of Contents
=================

* [Reading the Stack Trace](#reading-theS-tack-Trace)
* [Debugging with puts](#debugging-with-puts)
* [Debugging with Pry-byebug](#debugging-with-pry-byebugg with Pry-byebug)
  * [Matching Byebug Behaviour](#matching-byebug-behaviour)
* [How to Start Debugging](#how-to-start-debugging)

Reading the Stack Trace
-----------------------

In Ruby [errors](https://ruby-doc.org/core-3.1.2/Exception.html) are also objects called [exceptions](https://www.theodinproject.com/lessons/ruby-debugging)

Debugging with puts
--------------------

`p` is a combination of `puts` and [`inspect`](https://ruby-doc.org/core-3.1.2/Object.html#method-i-inspect)

Debugging with Pry-byebug
-------------------------

[Pry](https://github.com/pry/pry) is a Ruby gem that provides you with an interactive REPL while your program is running. The REPL provided by Pry is very similar to IRB but has added functionality. The recommended Ruby gem for debugging is [Pry-byebug](https://github.com/deivid-rodriguez/pry-byebug) and it includes Pry as a dependency. Pry-byebug adds step-by-step debugging and stack navigation.

Thus, adding a `binding.pry` line in our code is similar to creating a breakpoint in JavaScript.

To see this point in action, try running the following:

```ruby
require 'pry-byebug'

def yell_greeting(string)
  name = string

  binding.pry

  name = name.upcase
  greeting = "WASSAP, #{name}!"
  puts greeting
end

yell_greeting("bob")

```

During the session, if you check for the value of `name`, you will notice that you get back the value `bob` instead of `BOB`. What value do you think `greeting` will return? Yup, it will be `nil`. This is because `name = name.upcase` and `greeting = "WASSAP, #{name}!"` occurred after the binding.pry call and were never evaluated.

Using the same example above, you can use one of pry-byebug’s commands to figure out what `name = name.upcase` will return. You won’t need to quit the session or add another `binding.pry` beneath it. Enter ***next*** to step over to the next line.

##### Matching Byebug Behaviour

If you're coming from `Byebug` or from `Pry-Byebug` versions previous to 3.0, you may be lacking the 'n', 's', 'c' and 'f' aliases for the stepping commands. These aliases were removed by default because they usually conflict with scratch variable names. But it's very easy to reenable them if you still want them, just add the following shortcuts to your `~/.pryrc` file:

```ruby
if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
```

* `step` (advance one instruction, stepping into method calls)
* `next` (advance one instruction, doesn't get inside methods)
* `continue` (run until the end or next breakpoint)
* q[uit] or `Ctrl-D`

Also, you might find useful as well the repeat the last command by just hitting the `Enter` key (e.g., with `step` or `next`). To achieve that, add this to your `~/.pryrc` file:

```ruby
# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  pry_instance.run_command Pry.history.to_a.last
end
```

How to Start Debugging
----------------------

Programs generally go wrong due to two main reasons:

1. The program encounters an error and won’t run. For example, a typo may cause a syntax error to be raised that causes the program to crash. In this case, Ruby provides a stack trace.
1. The program runs but does not work the way you expect. For example, you expect a method to return a `2`, but it actually returns `6` when you run it. In this case, there is no stack trace.

VSCode Ruby rdbg Debugger
------------------------

[VSCode Ruby rdbg Debugger](https://github.com/ruby/vscode-rdbg)
