window.onload = () => get_all_users();

function get_all_users() {
    let list_users = document.querySelector("#list_users");
    fetch('http://localhost/recursos_online/api/v1/get_all_users')
        .then(response => {
            if (response.status === 200) {
                return response.json();
            } else {
                throw Error('erro');
            }
        })
        .then(dados => {
            if (dados.status === 'success') {
                let users = dados.results;
                if (users.lenght != 0) {
                    users.forEach(user => {
                        let li = document.createElement('li');
                        li.classList.add('clickable');
                        li.textContent = user.username;
                        li.addEventListener('click', () => {
                            document.querySelector("#user_info").textContent = user.username;
                            show_user_comments(user.id);
                        })
                        list_users.appendChild(li);
                    });
                }
            } else {
                throw Error('erro');
            }
        })
        .catch(err => {
            console.log('erro');
        })
}

function show_user_comments(id) {
    fetch('http://localhost/recursos_online/api/v1/get_all_comments_from_user/?id=' + id)
        .then(response => {
            if (response.status === 200) {
                return response.json();
            } else {
                throw Error('erro');
            }
        })
        .then(dados => {
            if (dados.status === 'success') {

                let post_container = document.querySelector("#posts");
                post_container.innerHTML = null;
                let posts = dados.results;
                let total_posts = dados.affected_rows;

                if (total_posts != 0) {
                    posts.forEach(post => {
                        let div_post = document.createElement('div');
                        div_post.classList.add("card", "bg-light", "p-3", "my-2");
                        div_post.innerHTML = `<i>${post.created_at}</i><strong>${post.comment}</strong>`;
                        post_container.appendChild(div_post);
                    });
                    document.querySelector("#no_posts").classList.add("d-none");
                } else {
                    document.querySelector("#no_posts").classList.remove("d-none");
                }

            } else {
                throw Error('erro');
            }
        })
        .catch(err => {
            console.log('erro');
        })
}