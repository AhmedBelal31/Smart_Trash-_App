// const server = new WebSocket.Server({ port: 8080 });
//
// // WebSocket connection event
// server.on("connection", async (socket) => {
// console.log("Client connected");
// const bins = await binsModel.find({});
// const data = {
// message: "You have updated Bins",
// data: bins ?? "There is something error",
// timestamp: new Date().toISOString(),
// };
// const jsonData = JSON.stringify(data);
// socket.send(jsonData);
// // Send JSON data every 5 seconds
// const interval = setInterval(async () => {
// const bins = await binsModel.find({});
// const data = {
// message: "You have updated Bins",
// data: bins ?? "There is something error",
// timestamp: new Date().toISOString(),
// };
// const jsonData = JSON.stringify(data);
// socket.send(jsonData);
// }, 5000);
//
// // WebSocket message event
// socket.on("message", (message) => {
// console.log("Received message:", message);
// // Process the received message from the client
// });
//
// // WebSocket close event
// socket.on("close", () => {
// console.log("Client disconnected");
// // Clear the interval when the client disconnects
// clearInterval(interval);
// });
// });