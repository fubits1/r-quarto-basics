# render for both true and false for comparison
lapply(c("false", "true"), function(compress_bool) {
  file_name <- sprintf("06-compress-data-handover_%s.html", tolower(compress_bool))
  quarto::quarto_render("06-compress-data-handover.qmd", 
                        output_file = file_name,
                        execute_params = list(compress = compress_bool))
})


# compare file sizes
out_files <- list.files("outputs", pattern = "06", full.names = TRUE)
sizes <- file.size(out_files)

sapply(seq_along(out_files), function(i) {
  size_hr <- utils:::format.object_size(file.size(out_files[i]), "auto")
  return(paste0(out_files[i], ": ", size_hr))
})

