const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;
app.get('/', (req, res) => {
    return res.json({
        message: 'I am nodejs in container v2!'
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});