import Pusher from 'pusher';

// init connection from mysql
const pusher = new Pusher({
    appId: "1487712",
    key: "fddc4c0d6a62419d59f2",
    secret: "5804256ead48f62b4c8d",
    cluster: "ap1",
    useTLS: true
});



export { pusher }
