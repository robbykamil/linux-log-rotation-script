# linux-log-rotation-script
Bash scripting untuk membuat sistem logging sederhana

Bash Log Rotation & Archive Script
Project ini adalah latihan Bash scripting untuk membuat sistem logging sederhana dengan fitur:
Membuat log monitoring sistem (availability) menggunakan command seperti top, uptime, free, dll.
Jika ukuran log mencapai 10 KB, otomatis membuat file log baru.
Jika jumlah file log mencapai 10 file, otomatis membuat archive .tgz.
Jika jumlah file .tgz mencapai 5 file, semua file archive akan dihapus.

