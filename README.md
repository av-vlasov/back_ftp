# back_ftp
# Бэкапирование файлов и БД mysql с хранением локальных копий и копированием их на ftp для debian.

## переменные:
*ul **DATE** - текущая дата, получается автоматически.
*ul **BACKDIR** - директория для локального хранения резервных копий.
*ul **TMP_FTP** - точка монтирования директории ftp.
*ul **LOGDIR** - директория для хранения логов.
*ul **LOG** - лог. Каждый день новый.

## Функции:

### MOUNT_FTP - монтирует директорию ftp.
монтирование происходит с помощью удилиты curlftp, проверяется её наличие, в случае отсутствия - устанавливает.
*ul **FTP_USER** - пользователь для подключения к ftp,
*ul **FTP_PASS** - пароль пользователя ftp,
*ul **FTP_HOST** - адрес ftp хоста,
*ul **FTP_PATH** - раздел на ftp для монтирования.

### COPY_ON_REMOTE_HOST - копирование файлов резервных копий на удаленный хост.

### DUMP_FILE - создание архивных копий директорий из FILE_LIST в BACKDIR и копирование их на ftp host.
формат FILE_LIST:
"name0:dir0 name1:dir1 ...." где:
name - понятное имя бэкапируемой директории;
dir - путь до бэкапируемой директории.

### DUMP_MYSQL - снятие дампов БД mysql из списка "DB_LIST", сохранение их в BACKDIR и копирование на ftp host.
*ul **HOST** - адрес mysql хоста ( по умолчанию localhost )
*ul **PORT** - порт mysql на хосте.
*ul **USER** - пользователь mysql с правами для снятия дампов.
*ul **PASS** - пароль пользователя mysql.
*ul **DB_LIST** - список БД для снятия дампов. Названия БД должны быть разделены пробелом внутри двойных кавычек ("dbnzme0 bdname1 ...")

### DELETE_OLD_LOCAL - удаление резервных копий старше N дней из директории BACKDIR.

### DELETE_OLD_REMOTE - удаление резервных копий старше N дней на ftp хосте.

### MAIN_FUNCTION - главная функция, запускающая все остальные и отмонтирующая ftp диск после выполнения всех остальных функций.

### CHECK_FREE_STACE - проверка свободного места в локальном хранилище и на ftp диске. Бекапирование будет запущено только в том случае, если и в локальном хранилище, и на ftp диске будет достаточно места для создания еще одной копии.
