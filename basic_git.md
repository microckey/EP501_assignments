# Basics of using git and GitHub for EP 501

This document describes some aspects of git useful for EP 501 in the simplest possible terms. We do not attempt to cover more difficult use cases or advanced features.  

## Note on git vs. GitHub

"git" is version control software that is installed by default on most computer systems.  GitHub is a website and service that provides a way to share codes under version control and has additional features like bug reporting and Project tracking.  You may also want to install GitHub desktop, which is a graphical interface for making commits and pushing changes to the remote branch (version of code) - this tutorial focuses mostly on command line use but many of the operations can also be done through the GitHub desktop GUI.  Signing up for a GitHub account can be done from the main page [https://github.com](https://github.com), and is free and takes just a few minutes.  


## Getting starting by forking the course repository

If you choose to use version control in this course the easiest way to do so it to first create a free account on github.com and then navigate to my course organization:  [https://github.com/Zettergren-Courses](https://github.com/Zettergren-Courses).  From there select the repository (hereafter "repo") corresponding to the language that you would like to use, for now either [MATLAB](https://github.com/Zettergren-Courses/EP501_matlab) or [Python](https://github.com/Zettergren-Courses/EP501_python).  

In the top right corner of the web page there is a button that will *fork* this repository (which is currently under the [Zettergren-Courses](https://github.com/Zettergren-Courses) organization).  The process of forking takes a few minutes to complete and creates a copy of the chosen code repo in your own online GitHub account.  This copy can be edited and altered with impunity and will not affect the copy that is housed in [Zettergren-Courses](https://github.com/Zettergren-Courses).  It is effectively you own personal online version of that repo.  Depending on your GitHub settings, this copy can be made public in case you want to share you codes with others.  By default only you will be able to make changes to your forked repository, although there are ways to allows others to contribute.  

## Cloning a local copy

Even though you have *forked* the course repository, you must still create a local copy on your computer in order to edit and run the codes with MATLAB or Spyder.  In order for this local version to be synchronize with your forked copy on GitHub you must *clone* your online repository.  To do this you need the URL for your forked copy, which can be obtained by visiting its website, clicking the "Code" button and then selecting and copying the URL from the menu that pops up.  Then you need to open a computer terminal window and navigate to the directory/folder where you wish to store the local (i.e. on your computer) version of the code.  From there you can execute the clone operation via a command:

```zsh
git clone https://github.com/mattzett/EP501_python1.git
```

Note that you will need to paste in the URL corresponding to your forked version of the repository.  This creates a copy of your forked repository in the subdirectory "EP501_python1".  

Your local copy of the code can now be edited with any software that you wish, including VIM, MATLAB editors, or Spyder.  Every change that you make will be tracked via "git" when you clone the repo this way.

## Keeping track of code changes

Once you work with your local copy and make changes you can create *commits* to make it easier to track development of your code and associated errors.  A commit is a "bookmark" to a "snapshot" of the state of your code at the time that it is made.  As such as you are developing you will want to make commits (bookmarks) fairly often so that you can go back and view the state of your code at any point in the past at which you've made a commit.  A key feature of "git" is that allows you to view or work with a copy of the code corresponding to any *commit* that you or anyone else have ever made on your repository.  Once you have made source code changes and wish to make a commit, you can do so by issuing a command from the main repo directory like:

```zsh
git commit -am "message describing changes in this commit"
```

All subsequent commits will be tracked, as well; one can view a list of commits via the command:

```zsh
git log
```

You can *checkout* a copy of the code corresponding to any past commit via the command:

```zsh
git checkout 1fce8a
```
where "1fce8a" should by the commit identifier corresponding to whichever commit you wish to view (a list of these identifiers can be seen by using ```git log```).  Issuing the checkout command basically copies the older version of the code over the contents of the directory that you are working in so that directly then contains the exact state of the code corresponding to that commit.  Once this is done you can run, alter, or otherwise test that specific commit as you would normally.  

To return to the most recent commit that you have made on a repo, you need to use the command:

```zsh
git checkout .
```
This resets all files in your directory back to their most recent versions (commits).  