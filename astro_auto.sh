AUTO_EXPOSURE=$(ls *.fit | tail -1 | awk -F"_" '{printf("%s\r", $3)}')
AUTO_BIN=$(ls *.fit | tail -1 | awk -F"_" '{printf("%s\r", $4)}')


astro_clean.sh
astro_prep.sh
astro_dss_prep.sh $AUTO_BIN $AUTO_EXPOSURE
astro_dss_stack.sh

echo
astro_get_stacked.sh
