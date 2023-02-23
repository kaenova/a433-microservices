# Menggunakan base image Node.js versi 14.
# My note: pake alpine biar bisa nge sh ke dalam
FROM node:14-alpine3.16
# Menentukan bahwa working directory untuk container adalah /app.
WORKDIR /app
# Menyalin seluruh source code ke working directory di container.
COPY . .
# Menentukan agar aplikasi berjalan dalam production mode dan menggunakan container bernama item-dbsebagai database host. Anda bisa salin kode berikut.
ENV NODE_ENV=production DB_HOST=item-db
# Menginstal dependencies untuk production dan kemudian build aplikasi. Anda bisa salin kode berikut.
RUN npm install --production --unsafe-perm && npm run build
# Ekspos bahwa port yang digunakan oleh aplikasi adalah 8080.
EXPOSE 8080
# Saat container diluncurkan, jalankan server dengan perintah npm start.
CMD ["npm", "start"]