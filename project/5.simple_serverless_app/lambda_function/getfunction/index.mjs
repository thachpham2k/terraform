export const handler = async(event) => {
    console.log(event);
    // TODO implement
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hello, This is get method'),
    };
    return response;
};
