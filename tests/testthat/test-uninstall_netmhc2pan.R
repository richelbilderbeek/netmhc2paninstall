test_that("uninstall absent NetMHCIIpan must throw", {

  if (netmhc2pan::is_netmhc2pan_installed()) return()

  expect_error(
    uninstall_netmhc2pan(netmhc2pan_folder_name = "/abs/ent"), # nolint use absolute path
    "Cannot uninstall absent NetMHCIIpan at"
  )
})

test_that("see if NetMHCIIpan is detected at a custom location", {

  if (!netmhc2pan::is_url_valid()) return()

  netmhc2pan_folder_name <- tempfile(pattern = "netmhc2pan_")
  expect_false(
    netmhc2pan::is_netmhc2pan_installed(
      netmhc2pan_folder_name = netmhc2pan_folder_name
    )
  )
  install_netmhc2pan(netmhc2pan_folder_name = netmhc2pan_folder_name)
  expect_true(
    netmhc2pan::is_netmhc2pan_installed(
      netmhc2pan_folder_name = netmhc2pan_folder_name
    )
  )
  unlink(netmhc2pan_folder_name, recursive = TRUE)
})
