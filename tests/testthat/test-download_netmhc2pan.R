test_that("use", {
  if (!netmhc2pan::is_url_valid()) return()

  netmhc2pan_tarfile_path <- tempfile(pattern = "netmhc2pan_")

  expect_silent(
    download_netmhc2pan_bin(
      netmhc2pan_bin_tarfile_path = netmhc2pan_tarfile_path
    )
  )
  expect_true(file.exists(netmhc2pan_tarfile_path))
})

test_that("use, verbose", {
  if (!netmhc2pan::is_url_valid()) return()

  expect_message(
    download_netmhc2pan_bin(
      netmhc2pan_bin_tarfile_path = tempfile(pattern = "netmhc2pan_"),
      verbose = TRUE
    )
  )
})
