#!/usr/bin/env bash
gaps_in=$(hyprctl -j getoption general:gaps_in | jq '.int')
gaps_out=$(hyprctl -j getoption general:gaps_out | jq '.int')

case $1 in
  --inc_in)   hyprctl keyword general:gaps_in $((gaps_in+5));;
  --dec_in)   hyprctl keyword general:gaps_in $((gaps_in-5));;
  --inc_out)  hyprctl keyword general:gaps_out $((gaps_out+5));;
  --dec_out)  hyprctl keyword general:gaps_out $((gaps_out-5));;
esac
