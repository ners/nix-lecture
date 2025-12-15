#import "../utils.typ": *

= Introduction
#speaker-note[
  + Don't worry if you don't know what Nix is yet – in fact, it's probably better if you don't
  + Explaining Nix to a total beginner is actually easier
  + Most Nix users don't even know what Nix is or how it works!
  + The reason for this is that different people use Nix for different things
  + Every Nix user learned Nix in different ways
  + Most people hear about Nix because someone tried selling it to them – often just the parts that *they* care about
  + And in fact, here we are in this lecture, and I'm also here to sell you Nix!
  + I believe Nix solves problems everybody here has encountered, even if not all things Nix offers are relevant to you
  + Nix is not a single technology but rather an implementation of an idea with a solid theoretical foundation and an area of active research
  + This means that the things we'll talk about today are highly transferrable
  + Whether or not you end up using Nix, these ideas will shape the future of software engineering
]

#focus-slide[
  #quote(attribution: <phd-thesis>)[
    Nix is a solution for getting *computer programs from one machine to another*
    #pause
    and having them *still work* when they get there.
  ]
  #speaker-note[
    + Nix was created in 2006 by Eelco Dolstra who introduced it as such
    + In principle, computer programs are a set of files, so transferring them between computers is a simple matter of copying those files
    + As you might already suspect, copying is not the issue – but we thought it was a good idea that the files should also work the same way on both machines
    + There are several reasons this is a hard problem worth solving:
      + There are more and more computers in the world
      + Despite standardisation, computers are more and more different
      + The software we want to run is more and more complex
    + We can't really change the first two things, but let's think about what makes a program complex
  ]
]

#include "motivation.typ"
#include "what-is-nix.typ"
