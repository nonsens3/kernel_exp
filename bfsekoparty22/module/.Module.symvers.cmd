cmd_/vagrant/module/Module.symvers := sed 's/\.ko$$/\.o/' /vagrant/module/modules.order | scripts/mod/modpost -m -a  -o /vagrant/module/Module.symvers -e -i Module.symvers   -T -
