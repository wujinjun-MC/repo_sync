#!/bin/bash
tar --remove-files -czvf - * .??* 2>/home/runner/repo_sync-tar.log | \
    split -b "$SPLIT_SIZE" --numeric-suffixes=1 --filter='bash -c "tee >(md5sum > $FILE.md5) > $FILE"' - artifacts.tar.gz.