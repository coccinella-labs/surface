#!/usr/bin/env bash
set -euo pipefail

owner="${1:?usage: audit-github-surface.sh <owner>}"

curl -s "https://api.github.com/users/${owner}/repos?per_page=100&type=all&sort=full_name" |
  jq -r '.[] | [.full_name, (if .archived then "archived" else "active" end), (.description // "")] | @tsv' |
  awk -F '\t' '
    BEGIN {
      print "repo\tstate\tdescription\tmarkers"
    }
    {
      markers = ""
      if ($3 ~ /[\[\]{}]/) markers = markers "brackets,"
      if ($3 != "" && $3 !~ /\.$/) markers = markers "missing-period,"
      if ($3 ~ /[A-Z]{2,}/) markers = markers "uppercase,"
      if ($3 ~ /[^\001-\177]/) markers = markers "non-ascii,"
      if (markers != "") {
        sub(/,$/, "", markers)
        print $1 "\t" $2 "\t" $3 "\t" markers
      }
    }
  '
