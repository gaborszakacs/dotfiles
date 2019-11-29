# auto-run go tests on file changed with colored output
alias gt="fswatch -e \".*\" -i \"\\.go$\" . | xargs -n1 -I {} sh -c \"clear && printf '\e[3J';go test ./... | sed ''/ok/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''\""
