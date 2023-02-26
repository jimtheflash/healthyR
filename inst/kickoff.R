devtools::load_all()

health_data_path <- '~/Downloads/apple_health_export 2/export.xml'
health_data <- import_health_data(health_data_path)

health_records <- extract_health_records(health_data)
tidy_health_records <-
