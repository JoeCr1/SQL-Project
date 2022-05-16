username="student"
password="student"
directory="/home/student/Data/cit325/final"

echo "User name: "  ${username}
echo "Password: "   ${password}
echo "Directory: "  ${directory}

declare -a cmd

cmd [0]="base_t.sql"
cmd [1]="create_tolkien.sql"
cmd [2]="dwarf_t.sql"
cmd [3]="elf_t.sql"
cmd [4]="goblin_t.sql"
cmd [5]="hobbit_t.sql"
cmd [6]="maia_t.sql"
cmd [7]="man_t.sql"
cmd [8]="orc_t.sql"
cmd [9]="noldor_t.sql"
cmd [10]="silvan_t.sql"
cmd [11]="teleri_t.sql"
cmd [12]="type_validation.sql"
cmd [13]="insert_instances.sql"
cmd [14]="query_instances.sql"

for i in ${cmd[*]}; do
    sqlplus -s ${username}/{password} @{directory}/${i} > /dev/null
done

cat type_validation.txt
cat query_instances.txt