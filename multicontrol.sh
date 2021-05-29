 #!/bin/bash
 do_command()
 {
         hosts=`sed -n '/^[^#]/p' /home/hostlist.txt`
        for host in $hosts
                do
                        echo ""
                         echo HOST $host
                         ssh $host "$@"
                 done
         return 0
 }
  
 if [ $# != 1 ]
 then

         echo "功能：批量在多台服务器上执行命令"
         echo "方法：$0 \"<cmd_to_exec>\""
         exit 1
 fi
 echo "确定要执行命令？[yes/no]：$@ "
 read to_run
  
if [ $to_run = "yes" -o $to_run = "YES" -o $to_run = "y" -o $to_run = "Y" ]
then
         echo ""
         echo -e "\033[31m执行命令 : $@ \033[0m"
         do_command "$@"
         echo ""
         $@
else
         echo "取消执行命令！"
fi
echo "=========================================="