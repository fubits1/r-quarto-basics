# benchmark
out_file_root <- "06-compress-data-handover_"

render_compress <- function(compress_bool) {
  file_name <- paste0(out_file_root, tolower(compress_bool), ".html")
  quarto::quarto_render("06-compress-data-handover.qmd", 
                        output_file = file_name,
                        execute_params = list(compress = compress_bool), quiet = TRUE)
}

# render for both true and false for comparison
tictoc::tic("rendering with compression")
render_compress(TRUE)# TRUE gets handed over as "yes"
tictoc::toc()


tictoc::tic("rendering without compression")
render_compress(FALSE)# FALSE gets handed over as "no"
tictoc::toc()

# compare file sizes
sizes <- data.frame(compress = c(TRUE, FALSE))
sizes$out_file <- paste0("outputs/", out_file_root, tolower(sizes$compress), ".html")

sizes$size <- sapply(sizes$out_file, function(file_name) {
  size_hr <- utils:::format.object_size(file.size(file_name), "auto")
  return(size_hr)
})

sizes
