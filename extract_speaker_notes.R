# Read input from an external text file
input_text <- readLines("posit-conf-2023.qmd", warn = FALSE)

# Combine lines into a single string
input_text <- paste(input_text, collapse = "\n")

# Define the regular expression
regex_pattern <- ":::{\\.notes}\\n([^::]*)\\n:::"

# Extract notes using regex
notes <- gregexpr(regex_pattern, input_text, perl = TRUE)
notes <- regmatches(input_text, notes)

# Flatten the list of matches
notes <- unlist(notes)

# Clean up the notes
notes <- gsub(x = notes, pattern = ":::{\\.notes}\\n\\n", replacement = "", perl = TRUE)
notes <- gsub(x = notes, pattern = "\\n\\n:::", replacement = "", perl = TRUE)

# Print the extracted notes
for (note in notes) {
  cat("----------------------", "\n", note, "\n")
}