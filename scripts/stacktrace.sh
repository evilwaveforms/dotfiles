#!/bin/bash
stacktrace () {
  gdb --batch -ex "t a a bt" -p `pgrep $1`
}
