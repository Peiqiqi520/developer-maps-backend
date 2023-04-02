#!/bin/bash

svn propset svn:global-ignores "$(cat .svnignore)" .
