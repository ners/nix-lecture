#import "../utils.typ": *

== Motivation

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
