#!/bin/bash
if [ "$1" == "stage" ] || [ "$1" == "dev" ]
then
cd /root/terraform-aws/dev/test4/code/$1
pwd
ls -l
echo -e "-------------------------- [ Destroying AWS Infra ] --------------------------"
terraform destroy
echo -e "========================= DONE =========================\n"
else
  echo -e "-----------"
  echo -e "Enter Valid Environment Name like (stage, dev or qa): ./$0 stage"
  echo -e "-----------"
fi
