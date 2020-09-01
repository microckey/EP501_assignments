# Basics of using git and GitHub for EP 501

This document describes some aspects of git useful for EP 501 in the simplest possible terms. We do not attempt to cover more difficult use cases or advanced features.  

## Note on git vs. GitHub

"git" is version control software that is installed by default on most computer systems.  GitHub is a website and service that provides a way to share codes under version control and has additional features like bug reporting and Project tracking.  You may also want to install GitHub desktop, which is a graphical interface for making commits and pushing changes to the remote branch (version of code) - this tutorial focuses mostly on command line use but many of the operations can also be done through the GitHub desktop GUI.  Signing up for a GitHub account can be done from the main page [https://github.com](https://github.com), and is free and takes just a few minutes.  


## Getting starting by forking the course repository

If you choose to use version control in this course the easiest way to do so it to first create a free account on github.com and then navigate to my course organization:  [https://github.com/Zettergren-Courses](https://github.com/Zettergren-Courses).  From there select the repository (hereafter "repo") corresponding to the language that you would like to use, for now either [MATLAB](https://github.com/Zettergren-Courses/EP501_matlab) or [Python](https://github.com/Zettergren-Courses/EP501_python).  

In the top right corner of the web page there is a button that will *fork* this repository (which is currently under the [Zettergren-Courses](https://github.com/Zettergren-Courses) organization).  The process of forking takes a few minutes to complete and creates a copy of the chosen code repo in your own online GitHub account.  This copy can be edited and altered with impunity and will not affect the copy that is housed in [Zettergren-Courses](https://github.com/Zettergren-Courses).  It is effectively you own personal online version of that repo.  Depending on your GitHub settings, this copy can be made public in case you want to share you codes with others.  

## Cloning a local copy

Even though you have *forked* the course repository, you must still create a local copy on your computer in order to edit and run the codes with MATLAB or Spyder.  In order for this local version to be synchronize with your forked copy on GitHub you must *clone* your online repository.  To do this you need the URL for your forked copy, which can be obtained by visiting its website, clicking the "Code" button and then selecting and copying the URL from the menu that pops up.  Then you need to open a computer terminal window and navigate to the directory/folder where you wish to store the local (i.e. on your computer) version of the code.  From there you can execute the clone operation via a command:

```bash
git clone https://github.com/mattzett/EP501_python1.git
```

Note that you will need to paste in the URL corresponding to your forked version of the repository.  This creates a copy of your forked repository in the subdirectory "EP501_python1".  

Your local copy of the code can now be edited with any software that you wish, including VIM, MATLAB editors, or Spyder.  Every change that you make will be tracked via "git" when you clone the repo this way.

## 


