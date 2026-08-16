import express from 'express';
const app = express();

app.get('/', (req, res) => {
  res.send('Welcome to the Gym Authenticator API');
});
app.listen(5000,()=>{
  console.log('Server is running on port 5000');
})
const PORT = process.env.PORT || 5000;
const server = app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
} );