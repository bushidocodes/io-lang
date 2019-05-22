Hi. I'm a polyglot developer backpacking across different language ecosystems with a sense of curiosity and the software equivalent of a Rick Steves' travel guide: Bruce A. Tate’s Seven Languages in Seven Weeks. In the previous post, I explored the Ruby programming language.

In this post, we are looking at io, a little-known language scripting languages that combines the LISP-like homoiconicity (all code is data) with a simple prototype-based object model and a simple message passing model. While the language was unsuccessful in becoming mainstream, its clean design demonstrates the how powerful a well thought design based on simple basic constructs can be. Learning the language is a good way to understand the foundation of prototype-based languages (such as JavaScript) and generally become a better programmer.

If you want to keep track of my travels as I explore other languages such as Io, Prolog, Scala, Erlang, Clojure, and Haskell, follow me on Twitter.

## Background

Many programmers hit a point in there careers where they feel the itch to unpack and learn the abstractions that they depend on. This drive powers the creation of many open-source passion projects. In 2002, [Steve Dekorte] developed an itch to learn learn about how interpreted programming languages work, and the result was [io]. While many programmers would be content to design a toy language to learn the concepts, Steve's appreciation of the theory and history of programming languages allowed him to produce a design that showed great promise and attracted attention. He took bits of LISP, bits of Smalltalk, and created something that made programming language nerds drool. 

Steve released the first version of io in April 2002, and he attracted and engaged with a strong community of early-adopters to refine the language. In 2005, he encapsulated his design principles in an [ACM SIGPLAN conference paper]. Throughout this time, tinkerers and language enthusiasts began to blog about his language.

io seems to have attracted particular attention from the Ruby community (see my previous post for information on Ruby). At RubyConf 2005, Matz (the creator of Ruby) was asking which languages would be worth learning, and [he suggested io as his top choice]. 

Between the SIGPLAN article and the Matz suggestion, io seems to have hit a high water mark in 2005 based on the number of comments in the io Yahoo message board. There was another increase in 2008, which may have been related to the famous Rubyist [_why blogging about the language].

"Did you know that Io’s introspection and meta tricks put Ruby to serious shame? Where Ruby once schooled Java, Io has now pogoed." ~ _why

Given the awareness and influence of the ideas of io in the Ruby community, it make sense that Bruce A. Tate included the language in Seven Languages in Seven Weeks. He described the language as "the most controversial language \[he\] included," noting that the language was not commercially successful but "has a shot to grow."

Over the next few years, several developers blogged about the language, typically in the context of working through the Seven Languages in Seven Weeks book (as I'm doing now). In 2014, enthusiasts started to daydream about [2nd gen io] on the Yahoo message board, but nothing came of it, and by around 2015 or so, the language seems to have effectively flatlined. A 2015 redesign of the io language website sparked some discussions and reminiscences on Hacker News, which do an excellent describing the spirit of the language. Here is an example comment: 

```
As someone who loves Io, it gets my attention because:
— the language is very mutable, almost all behaviours can be modified
— it's simple, all you can do is send messages to objects
— you can write DSLs and macro-like things without special macro support
— it's so dynamic you'll end up live-coding without realizing it
It has less syntax than Smalltalk, it's homoiconic like Lisp, but doesn't need support for macros because of the way messages are handled.
A not intolerable way of thinking of Io is it is to object calculus what Lisp is to lambda calculus. There are parts where that analogy breaks down but it's not a bad first approximation."
~smosher_
```

On this thread, Steve mentioned that he was interested in doing a JavaScript port of io, but that his other crypto and decentralized web projects had been taking up his time. He asked if anyone was interested in helping with the JavaScript port, but he got no response. I suspect that Steve might be interested in this (perhaps now targeting WebAssembly instead), so if any readers are interested, consider reaching out.

## Why did io flatline? 
I can only speculate why io did not achieve greater success, but a Quora post suggests that it might have been due to the fact that io was largely positioned as a language suitable for embedding in large C or C++ codebases, which put it in competition with Lua. 
In the aforementioned Hacker News thread, Steve said the following: 

"Io and Lua are light and embeddable but while Io is much slower than Go (and much higher level), I suspect Lua is probably the fastest scripting language around and LuaJIT may be competitive (perhaps even faster) than lower level garbage collected systems languages like Go and Java. Looking back, I wish I had written Io in Lua."

This suggests that the perhaps within the embedded language space, io's inferior performance compared to lua just made it hard to compete.

Another factor just seems to be that Steve decided to move onto new projects, including a webrtc-based decentralized message platform that seems like the sort of thing that would integrate with Sir Tim Berners-Lee's SOLID project. Given the recent controversies around social media and the ownership of personal data, it's hard for me to argue with how he's allocating his time.

### Aside: Are you like Steve circa 2002? Do you want to learn how programming languages work?

I've never built a programming language myself, but I have had those sorts of impulses. I've done a bit of research on how I might most effectively learn this knowledge since I've never taken a compiler course. For those willing to look at textbooks, the [Dragon book] seems to be the dominant book in the space. Alternatively, one might be interested in [Thorsten Ball]'s [Writing An Interpreter In Go] and [Writing A Compiler In Go], which offer a paint-by-numbers approach to implementing the [Monkey Programming Language].

For those that are also interested in computer architecture, assembly languages, virtual machines, etc., you might want to check out Noam Nisan or Shimon Schocken's [The Elements of Computing Systems]. It claims to offer soup-to-nuts instructions that take you from building NAND Gate to writing Tetris in the Jack programming language.

I'm considering these books for future projects and blog posts.

## Easiest way to explore io
The io website offer recent packages on their site, but it seems that they have lagged a bit behind source. I decided to Dockerize the interpreter based off the latest x64 debian binary, so if you're running Docker, you're more than welcome to fork my repo at....

## Impressions of the Language

, I see a 20110905 timestamp.

Prototype based language like Lua or JavaScript

Receivers on the Left

Messages on the right
Messages return objects
Messages take optional parameters in parantheses

## Interesting io Links
- Official IO page - https://iolanguage.org/
- Presentation deck on io - http://soft.vub.ac.be/~tvcutsem/talks/presentations/IO-tvcutsem-26-11-04.pdf
- Recorded Lecture on the io language in an Emerging Languages course - https://www.youtube.com/watch?v=x2KtYbNzhSg
- io SIGPLAN article - https://pdfs.semanticscholar.org/55ab/3eed8e782a05d4f05d93331889b86da247e7.pdf
- IO Yahoo Message Boards - https://groups.yahoo.com/neo/groups/iolanguage/conversations/messages
- _why post - https://viewsourcecode.org/why/hackety.org/2008/01/05/ioHasAVeryCleanMirror.html
- Another _why post - http://web.archive.org/web/20080430135919/http://hackety.org/2008/01/10/lazyBricksLazyMortar.html
- io wikibook - https://en.wikibooks.org/wiki/Io_Programming
- io HackerNews thread - https://news.ycombinator.com/item?id=8867575
- Why is io not more popular? on Quora - https://www.quora.com/Why-is-the-Io-language-not-more-popular
- io repos on GitHub: https://github.com/search?utf8=%E2%9C%93&q=language%3AIo&type=Repositories&ref=advsearch&l=Io&l=
- io to javascript transpiler - https://github.com/dariusf/iota

[Bruce Tate]: https://twitter.com/redrapids
[Steve Dekorte]: https://twitter.com/stevedekorte
[ACM SIGPLAN conference paper]: http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.95.3637&rep=rep1&type=pdf
[io]: http://iolanguage.org/
[Thorsten Ball]: https://twitter.com/thorstenball
[Writing An Interpreter In Go]: https://interpreterbook.com/
[Writing A Compiler In Go]: https://compilerbook.com/
[Dragon book]: https://www.amazon.com/Compilers-Principles-Techniques-Tools-2nd/dp/0321486811
[Monkey Programming Language]: https://interpreterbook.com/#the-monkey-programming-language
[The Elements of Computing Systems]: https://www.nand2tetris.org/
[he suggested io as his top choice]: https://web.archive.org/web/20060617193306/http://jroller.com/page/obie?entry=matz_roundtable_notes
[_why blogging about the language]: https://viewsourcecode.org/why/hackety.org/2008/01/05/ioHasAVeryCleanMirror.html
[A 2015 redesign of the io language website sparked some discussions and reminiscences on Hacker News]: https://news.ycombinator.com/item?id=8867575