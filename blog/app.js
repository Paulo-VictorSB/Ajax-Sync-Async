document.querySelector('#btn').addEventListener('click', () => {

    document.querySelector('#loading').classList.remove('d-none');
    document.querySelector('#loading').classList.add('d-flex');

    fetch('http://localhost/Ajax-Sync-Async/blog/api/v1/get_all_users/')
        .then(response => {
            if (!response.ok) {
                document.querySelector('#loading').classList.add('d-none');
                document.querySelector('#loading').classList.remove('d-flex');
                throw new Error("Dados indisponíveis.");
            }
            return response.json();
        })

        .then(data => {
            document.querySelector('#loading').classList.add('d-none');
            document.querySelector('#loading').classList.remove('d-flex');
            const users = data.results;
            const table_users = document.querySelector('#table_users');

            table_users.innerHTML = null;

            users.forEach(user => {
                let row = document.createElement('tr');

                let name = document.createElement('td');
                name.innerText = user.username;

                let email = document.createElement('td');
                email.innerText = user.email;

                let createdAt = document.createElement('td');
                createdAt.innerText = user.created_at;


                row.append(name, email, createdAt);
                table_users.append(row);
                document.querySelector('#table').classList.remove('d-none');
            })
        })
        .catch(error => {
            let err = document.querySelector('#error');
            err.innerText = error.message;
            err.classList.remove('d-none');
        })
})