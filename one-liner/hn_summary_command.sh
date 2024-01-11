(
    echo '[INST]generate a summary that captures the key points, predominant sentiments, and any notable arguments or insights shared by the commenters. Keep it concise but it can be longer if necessary. The hacker news thread is as follows'
    links -codepage utf-8 \
        -force-html \
        -width 500 \
        -dump https://news.ycombinator.com/item\?id\=38505211 |
        sed 's/   */ /g'
    echo '[/INST]'
) | ./mistral-7b-instruct-v0.2.Q4_K_M.llamafile \
      -f /dev/stdin \
      --temp 0.4 -c 0 \
      --silent-prompt 2>/dev/null
