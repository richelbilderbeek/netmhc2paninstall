#' Uninstall NetMHCIIpan
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_netmhc2pan <- function(
  netmhc2pan_folder_name = netmhc2pan::get_default_netmhc2pan_folder()
) {
  if (!netmhc2pan::is_netmhc2pan_installed(netmhc2pan_folder_name)
  ) {
    stop(
      "Cannot uninstall absent NetMHCIIpan ",
      "at folder '", netmhc2pan_folder_name, "'"
    )
  }
  bin_file_path <- file.path(
    netmhc2pan_folder_name,
    basename(netmhc2pan::get_default_netmhc2pan_subfolder()),
    basename(netmhc2pan::get_default_netmhc2pan_bin_path())
  )
  testit::assert(file.exists(bin_file_path))
  unlink(x = netmhc2pan_folder_name, recursive = TRUE)
}
