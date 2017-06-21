#!/bin/bash
if [ "$1" == "stage" ] || [ "$1" == "dev" ]
then
cd /root/terraform-aws/dev/test4/code/$1
pwd
ls -l
echo -e "-------------------------- [ Trying to get terraform Modules ] --------------------------"
terraform get
echo -e "-------------------------- [ Running Terraform Plan ] --------------------------"
terraform plan
export stat=$?
if [ "$stat" == 0 ];then
echo -e "-------------------------- [ Applying terraform code ] --------------------------"
#echo ${stat}
terraform apply
else
exit 0
fi
echo -e "========================= DONE =========================\n"
else
  echo -e "-----------"
  echo -e "Enter Valid Environment Name like (stage, dev or qa): ./$0 stage"
  echo -e "-----------"
fi
