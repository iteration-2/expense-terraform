module "frontend" {
  source        = "./modules/app"
  instance_type = var.instance_type
  component     = frontend
  shh_user      = var.ssh_user
  shh_pass      = var.ssh_pass
  env           = var.env
  zone_id       = var.zone_id
}

#module "mysql" {
#  source = "./modules/app"
#}
#
#module "backend" {
#  source = "./modules/app"
#}