#import "../utils.typ": *

== What is Nix?
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

#quote(attribution: <phd-thesis>)[
  Nix is a solution for getting *computer programs from one machine to another*
  #pause
  and having them *still work* when they get there.
]

#pagebreak()
#speaker-note[
  + Software is ultimately 'just a set of files' – but we increasingly build our software on top of existing components that we call dependencies
  + ✋: Who has installed a compiler in the last year?
  + ✋: Who has had to collaborate with another person on a software project?
  + ✋: Who ran into issues doing any of these?
  + People who did not raise their hands either don't write software or are in an ecosystem that solves these problems for them
  + For the rest of us (and in the general case), the problem is not yet solved
  + A common form of specification is documentation (README, ...)
  + Documentation may not be complete, correct, up-to-date, or even present at all
  + This hurts the user, not the author; keep testing the specification
]

- Software that we want to run has dependencies external to it
  #pause
  - The author of the software has all the dependencies installed
  #pause
  - Most people will not have dependencies installed
#parspace
#pause
- How can the author share their software with other people?
  #pause
  - At the very least, specify the dependencies
  #pause
  - The specification should be a program

// Consider reusing visual example here

#pagebreak()
#speaker-note[
  + Linux is an example of an ecosystem that solves these problems for you
  + Examples include: apt, rpm, Homebrew, flatpak
  + Even if you use the same package manager, on different computers you might get different versions
  + When updating software, old versions are deleted
  + Updating one program's dependency interferes with all other programs that have this dependency
]

- Linux users traditionally install software with package managers
  #pause
  - different package managers have different availability of software
  #pause
  - package managers overwrite existing files when installing new ones
    #pause
    - how do we go back if something stops working?
    - what if we want multiple versions of the same software?
#parspace
#pause
- We can use Podman and Docker to copy filesystem images between computers
  #pause
  - no guarantee that the image came from the recipe
  #pause
  - even with the recipe there is no guarantee it is complete or correct
  #pause
  - these are repeatable, but not reproducible
  #pause
  - outside of the scope of this lecture

#pagebreak()

#speaker-note[
]

- How do we ensure that a specification is complete and correct?
  #pause
  - Run the program in an isolated environment
  #pause
  - Only give it access to resources declared by the specification
  #pause
  - Do not give it access to the network or hardware

#pagebreak()

- *Reproducible*
  - if a package works on one machine, it will also work on another
  - if it built yesterday it will still build today
#parspace
#pause
- *Declarative*
  - requirements must be specified completely and correctly
  - specifications can be composed
#parspace
#pause
- *Reliable*
  - packages do not interfere with each other
  - atomic: roll back to previous versions

#pagebreak()

#speaker-note[
  + As mentioned, Nix is not just one thing but an ecosystem
  + Parts of this ecosystem are named somewhat confusingly
  + Let's introduce the main characters
  + From now on, Nix shall refer to the package manager
]

- The Nix ecosystem is many things:
  #pause
  - Nix: the program
  #pause
  - Nix language: the functional language
  #pause
  - Nixpkgs: the software repository
  #pause
  - NixOS: the Linux distribution

= Nix store

#speaker-note[
  + To understand how Nix works, we must introduce a central concept called the Nix store
  + To help illustrate the concept, I will draw a parallel with how programs interact with computer memory
]
