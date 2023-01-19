# render for both true and false for comparison
lapply(c("false", "true"), function(compress_bool) {
  file_name <- sprintf("06-compress-data-handover_%s.html", tolower(compress_bool))
  quarto::quarto_render("06-compress-data-handover.qmd", 
                        output_file = file_name,
                        execute_params = list(compress = compress_bool))
})


