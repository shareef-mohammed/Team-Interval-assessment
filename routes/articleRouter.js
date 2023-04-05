const express = require('express');
const { postArticle, createCategory, getCategories, getArticles, categoryBasedArticles, updateArticle, deleteArticle } = require('../controllers/articleController');
const router = express()

router.post('/articles', postArticle);
router.post('/category', createCategory);
router.get('/categories', getCategories);
router.get('/articles', getArticles);
router.get('/articles/:category', categoryBasedArticles);
router.put('/articles/:id', updateArticle);
router.delete('/articles/:id', deleteArticle);

module.exports = router;